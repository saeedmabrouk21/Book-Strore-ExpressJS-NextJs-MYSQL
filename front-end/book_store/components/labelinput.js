export default function LabelInput(props){
    return(
        <>
        <label for={props.name}>{props.name}</label>
        <input id={props.name} name={props.name} type={props.type} {...(props.required && "required")} />
        </>
    )
}